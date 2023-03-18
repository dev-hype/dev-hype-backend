FROM node:16.8.0-alpine

RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY . .

ENV NODE_ENV production

ARG DATABASE_URL

RUN npm install -g pnpm
RUN npm install -g @nestjs/cli

RUN pnpm install --frozen-lockfile

RUN pnpm build

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nestjs

USER nestjs

CMD ["pnpm", "start:prod"]
