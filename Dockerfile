# Build stage
FROM ruby:3.3.6-slim AS builder

# Install build dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    curl \
    git \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local deployment 'true' && \
    bundle config set --local without 'development test' && \
    bundle config set --local path '/usr/local/bundle' && \
    bundle install --jobs=4 --retry=3 && \
    rm -rf ~/.bundle/ /usr/local/bundle/cache /usr/local/bundle/bundler/gems/*/.git

# Copy application code
COPY . .

# Precompile assets
RUN RAILS_ENV=production SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# Runtime stage
FROM ruby:3.3.6-slim AS base

# Install runtime dependencies only
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Create a non-root user first
RUN groupadd -r rails && useradd -r -g rails rails

# Copy gems from builder
COPY --from=builder /usr/local/bundle /usr/local/bundle

# Copy application code
COPY --from=builder /app /app

# Create necessary directories and set permissions
RUN mkdir -p tmp/pids tmp/cache log storage && \
    chown -R rails:rails /app

USER rails

# Expose port (Kamal will set PORT env var, default is 80 with proxy)
EXPOSE 3000

# Health check (Kamal sets PORT=80 by default when using proxy)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD sh -c 'curl -f http://localhost:${PORT:-3000}/up || exit 1'

# Default command
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
