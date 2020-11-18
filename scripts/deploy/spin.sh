docker run --rm -it -p 6878:5000 \
  -e MONGO_URL=mongodb://backend:GuQR4vB6b6lKSpfIH@test4.casino.testenv.io/heteor-backend \
  -e REDIS_URL=redis://test4.casino.testenv.io \
  -e POSTGRES_URL=ecto://postgres:postgres@test4.casino.testenv.io:5533/realrtp-2 \
  -e AMQP_URL=amqp://test4.casino.testenv.io \
  -e AMQP_EXCHANGE="service.event.tx" \
  -e AMQP_ROUTING_KEY="casino.#" \
  -e AMQP_QUEUE="casino.rtp.handle_bets" \
  -e WORKER_SCHEDULE="* * * * *" \
  -e GAME_UPDATE_INTERVAL=5000 \
  -e PUBLIC_GATEWAY=redis://test4.casino.testenv.io \
  -e SERVICE_PORT=4000 \
  -e DAILY_BET_THRESHOLD=10 \
  -e WEEKLY_BET_THRESHOLD=30 \
  real-rtp:$1