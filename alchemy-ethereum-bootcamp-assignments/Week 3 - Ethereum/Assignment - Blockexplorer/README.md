# Ethereum Block Explorer

The lessons this week covered the Ethereum JSON-RPC API and the `ethers.js` library giving us the ability to query the Ethereum blockchain and make transactions!

Let's put that knowledge to the test by building our very own **Ethereum Block Explorer**!

Blockexplorers give us the ability to view lots of different information about the blockchain including data about:

- the blockchain network itself
- blocks in the blockchain
- transactions in a block
- accounts
- and many other things

[Etherscan](https://etherscan.io/) is a good example of an Ethereum blockexplorer. Check it out to get familiar with how blockexplorers generally work.

This particular project is very much open-ended. We'll add some challenges here to get your imagination going, but use Etherscan as a guide for features you might consider building in your project.

## Getting Started

Clone this project to pull down some basic starter code.

After that cd into the base directory of the project and run `npm install` to download all the project dependencies.

In this project we chose to use React for a front-end and added minimal front-end code to get you going, but feel free to use any front-end stack you like.

Unlike the lessons this week that used the Ethereum JSON-RPC API and the `ethers.js` library to communicate with the Ethereum network, the starter code in this project uses the [AlchemySDK](https://docs.alchemy.com/reference/alchemy-sdk-quickstart?a=eth-bootcamp). The AlchemySDK's core package wraps almost all of the `ethers.js` provider functionality that we learned about and should feel very familiar to you.

For example, the following `ethers.js` code

```js
const blockNumber = await provider.getBlockNumber();
```

can be written using the AlchemySDK like so:

```js
const blockNumber = await alchemy.core.getBlockNumber();
```

Another `ethers.js ` example

```js
const transcations = await provider.getBlockWithTransactions(SOME_BLOCK_NUMBER);
```

translates to

```js
const transactions = await alchemy.core.getBlockWithTransactions(
  SOME_BLOCK_NUMBER
);
```

and so on.

There are some `ethers.js` provider functions that are not often-used and therefore not included in `alchemy.core`. But if you ever need the full ethers provider functionality you can access the provider directly with the following code:

```js
const ethersProvider = await alchemy.config.getProvider();
```

You can find lots of good docs on the AlchemySDK here:

- [API Quickstart](https://docs.alchemy.com/reference/alchemy-sdk-quickstart?a=eth-bootcamp)
- [API Overview](https://docs.alchemy.com/reference/api-overview?a=eth-bootcamp)

Alright, without further ado, let's get started!

## 1. Create a unique Alchemy API key

If you have not already done so, create a unique Alchemy API Mainnet key
for your project as [described here](https://docs.alchemy.com/reference/api-overview?a=eth-bootcamp).

## 2. Add your API key to as an environment variable for the project

Create an empty `.env` file in the base directory of this project.

Add the following line to the `.env` file replacing `YOUR_ALCHEMY_API_KEY` with your api key.

```sh
REACT_APP_ALCHEMY_API_KEY=YOUR_ALCHEMY_API_KEY
```

Do not remove the `REACT_APP_` prefix. React uses that to import env variables.

**⚠️ Note**

> Your Alchemy API Mainnet Key is a sensitive piece of data. If we were\
> building an enterprise app to conquer the world we would never place\
> this sensitive data in the client code of our blockexplorer project that\
> could potentially be read by anyone.
>
> But hey, we're just learning this stuff right now, not conquering anything\
> yet! :-) It won't be the end of the world to put the Alchemy API key in our\
> front-end code for this project.

## 3. Start the webserver

`npm start`

Running the command above will run the app in the development mode. Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The webpage will automatically reload when you make code changes.

What you'll see in the browser is Ethereum Mainnet's current block number. Not very exciting, but that's where you come in to save the day!
