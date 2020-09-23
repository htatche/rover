# Rover

## Install

```
git clone https://github.com/htatche/rover
cd rover
docker build -t rover .
```

## Run

```
docker run -i -t rover
```

Be wary, rovers are extremely capable machines that must be handled with care.
Sending the wrong instructions will result in the program halting!

## Specs

```
docker run -i -t --entrypoint rspec rover
```
