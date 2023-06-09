import { NestFactory } from '@nestjs/core'
import { ConfigService } from '@nestjs/config'
import { Logger } from '@nestjs/common'

import { AppModule } from './app.module'

async function bootstrap() {
  const app = await NestFactory.create(AppModule)

  const configService = app.get(ConfigService)
  const PORT = configService.get('PORT')

  await app.listen(PORT, () => {
    Logger.log(`Server running on port ${PORT}`)
  })
}

bootstrap()
