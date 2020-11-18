#!/bin/bash

mix phx.gen.schema Models.DailyBetTotal \
  daily_bet_totals \
  game_id:string \
  amount:decimal \
  count:integer \
  calculated_at:naive_datetime

mix phx.gen.schema Models.DailyWinTotal \
  daily_win_totals \
  game_id:string \
  amount:decimal \
  count:integer \
  calculated_at:naive_datetime