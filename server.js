import Fastify from 'fastify';
import pino from 'pino';

const app = Fastify({ loggerInstance: pino() });
app.get('/health', async () => ({ status: 'ok' }));
await app.listen({ port: 3000, host: '0.0.0.0' });
