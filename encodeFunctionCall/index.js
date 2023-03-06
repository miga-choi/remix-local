const Web3 = require('web3');

const web3 = new Web3(
  'https://mainnet.infura.io/v3/'
);

const main = async () => {
  const result = await web3.eth.abi.encodeFunctionCall(
    {
      inputs: [
        {
          internalType: 'string',
          name: '_name',
          type: 'string',
        },
        {
          internalType: 'string',
          name: '_symbol',
          type: 'string',
        },
      ],
      name: 'initialize',
      outputs: [],
      stateMutability: 'nonpayable',
      type: 'function',
    },
    ['TEST', 'test']
  );
  console.log('result: ', result);
};

main();
