pragma solidity ^0.5.0;
import './DappToken.sol';
import './DaiToken.sol';

contract TokenFarm {

  string public name = 'Dapp Token Farm';
  DappToken public dappToken; //assign as state variables
  DaiToken public daiToken;
    //deploy DAI - grab address
    //deploy DAPP - grab address
  constructor(DappToken _dappToken, DaiToken _daiToken) public {
    dappToken = _dappToken; //pass down smart contract
    daiToken = _daiToken;
  }
}
//test code
