# Chaincoin Masternode for Docker

This is a dockerized masternode for Chaincoin (CHC). This project is roughly based on [Chaincoin's Tutorial & Guides](https://github.com/chaincoin-legacy/chaincoin/wiki/Tutorials-&-Guides). You may need some basic knowledge on how masternodes work in order to understand the content of this page.

## Quickstart

Clone this repository first and build a docker image.

```
docker build -t chc-mn .
```
(chc-mn is just an example; you can choose whatever name you want)

There are two required variables: `masternodeprivkey` and `externalip`. `masternodeprivkey` is the value you get when you execute `masternode genkey` on your wallet's debug console. `externalip` is the IP address of the server you want your masternode to run on.

If you got these two variables then you can simple start the masternode docker using the following command:

```
docker run -e masternodeprivkey=<masternodeprivkey> -e externalip=<IP Address> -it -d chc-mn
```

If you run for the first time, the masternode daemon needs to be synchorized with the network and it'll take some time before you can actually connect it with your remote wallet. You can check the basic state of the daemon server with the provided `check.sh` script. Once the daemon is ready, you'll get an output similar to one below:

```
{
    "version" : 90303,
    "protocolversion" : 70003,
    "walletversion" : 61000,
    "balance" : 0.00000000,
    "darksend_balance" : 0.00000000,
    "blocks" : 1393319,
    "timeoffset" : 0,
    "connections" : 22,
    "proxy" : "",
    "ip" : "52.11.178.148",
    "difficulty" : 371.79682652,
    "testnet" : false,
    "keypoololdest" : 1518702243,
    "keypoolsize" : 1001,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
{
    "<Your IP>" : "ENABLED"
}
{
    "<Your IP>" : 78162
}
```

The value `blocks` should be the blocksize and once the masternode is connected with your remote wallet, the last two values should be `"ENABLED"` and some value greater than 0 (zero).


## Donations

If this project was helpful, kindly donate to the following address so that I can continue improve the stability of this project:

(Chaincoin, CHC): `CTQNfic3QL4NaXbVLstwJtEuKWY21fQsKn`

Thanks and happy masternoding! :)