#!/bin/bash

# brew install protobuf

# Casino Proto
rm -rf ./priv/proto/build/casino
mkdir -p ./priv/proto/build/casino
protoc -I ./priv/proto/casino/src --elixir_out=./priv/proto/build/casino --plugin=protoc-gen-elixir=./scripts/protoc-gen-elixir ./priv/proto/casino/src/banking/money.proto

## transactionPart
if [[ "$OSTYPE" == "linux-gnu" ]];
then
    sed -rie '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/transactionPart.proto
else
    sed -i '' -e '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/transactionPart.proto
fi
protoc -I ./priv/proto/casino/src --elixir_out=./priv/proto/build/casino --plugin=protoc-gen-elixir=./scripts/protoc-gen-elixir ./priv/proto/casino/src/casino/transactionPart.proto

## bet
if [[ "$OSTYPE" == "linux-gnu" ]];
then
    sed -rie '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/bet.proto
    sed -rie '3s/^//p; 3s/^.*/import "casino\/transactionPart.proto";/' ./priv/proto/casino/src/casino/bet.proto
else
    sed -i '' -e '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/bet.proto
    sed -i '' -e '3s/^//p; 3s/^.*/import "casino\/transactionPart.proto";/' ./priv/proto/casino/src/casino/bet.proto
fi
protoc -I ./priv/proto/casino/src --elixir_out=./priv/proto/build/casino --plugin=protoc-gen-elixir=./scripts/protoc-gen-elixir ./priv/proto/casino/src/casino/bet.proto
cd priv/proto/casino && git checkout src/casino/bet.proto && cd -

## win
if [[ "$OSTYPE" == "linux-gnu" ]];
then
    sed -rie '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/win.proto
    sed -rie '3s/^//p; 3s/^.*/import "casino\/transactionPart.proto";/' ./priv/proto/casino/src/casino/win.proto
else
    sed -i '' -e '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/win.proto
    sed -i '' -e '3s/^//p; 3s/^.*/import "casino\/transactionPart.proto";/' ./priv/proto/casino/src/casino/win.proto
fi
protoc -I ./priv/proto/casino/src --elixir_out=./priv/proto/build/casino --plugin=protoc-gen-elixir=./scripts/protoc-gen-elixir ./priv/proto/casino/src/casino/win.proto
cd priv/proto/casino && git checkout src/casino/win.proto && cd -

## rollback
if [[ "$OSTYPE" == "linux-gnu" ]];
then
    sed -rie '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/rollback.proto
    sed -rie '3s/^//p; 3s/^.*/import "casino\/transactionPart.proto";/' ./priv/proto/casino/src/casino/rollback.proto
else
    sed -i '' -e '3s/^//p; 3s/^.*/import "banking\/money.proto";/' ./priv/proto/casino/src/casino/rollback.proto
    sed -i '' -e '3s/^//p; 3s/^.*/import "casino\/transactionPart.proto";/' ./priv/proto/casino/src/casino/rollback.proto
fi
protoc -I ./priv/proto/casino/src --elixir_out=./priv/proto/build/casino --plugin=protoc-gen-elixir=./scripts/protoc-gen-elixir ./priv/proto/casino/src/casino/rollback.proto
cd priv/proto/casino && git checkout src/casino/rollback.proto && cd -
cd priv/proto/casino && git checkout src/casino/transactionPart.proto && cd -

mix format