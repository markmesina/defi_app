const { assert } = require('chai');

const DappToken = artifacts.require('DappToken');
const DaiToken = artifacts.require('DaiToken');
const TokenFarm = artifacts.require('TokenFarm');

require('chai')
  .use(require('chai-as-promised'))
  .should();

// converter function
function tokens(n) {
  return web3.utils.toWei(n, 'ether');
}
contract('TokenFarm', ([owner, investor]) => {
  //set up variables
  let daiToken, dappToken, tokenFarm

  before(async () => {
    //load contracts
    daiToken = await DaiToken.new()
    dappToken = await DappToken.new()
    tokenFarm = await TokenFarm.new(dappToken.address, daiToken.address)

    //transfer all DApp tokens to farm (1 million)
    await dappToken.transfer(tokenFarm.address, tokens('1000000'));

    // send tokens to investor
    await daiToken.transfer(investor, tokens('100'), { from: owner})
  })


  //test code
  describe('Mock DAI deployement', async () => {
    it('has a name', async () => {
      const name = await daiToken.name()
      assert.equal (name, 'Mock DAI Token')
    })
  })

  describe('Dapp Token deployement', async () => {
    it('has a name', async () => {
      const name = await dappToken.name()
      assert.equal (name, 'DApp Token')
    })
  })

  describe('Token Farm deployement', async () => {
    it('has a name', async () => {
      const name = await tokenFarm.name()
      assert.equal (name, 'Dapp Token Farm')
    })

    //confirm account has balance test
    it('contract has tokens', async () => {
      let balance = await dappToken.balanceOf(tokenFarm.address)
      assert.equal(balance.toString(), tokens('1000000'))
    })
  })

});