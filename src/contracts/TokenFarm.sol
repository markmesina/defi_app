pragma solidity ^0.5.0;
import './DappToken.sol';
import './DaiToken.sol';

contract TokenFarm {

  string public name = 'Dapp Token Farm';
  DappToken public dappToken; //assign as state variables
  DaiToken public daiToken;
    //deploy DAI - grab address
    //deploy DAPP - grab address

  address[] public stakers; //array off people who has stake on the app

  mapping(address => uint) public stakingBalance;
  mapping(address => bool) public hasStaked; //keeps track of people who staked
  mapping(address => bool) public isStaking; //keeps track of people who staked

  constructor(DappToken _dappToken, DaiToken _daiToken) public {
    dappToken = _dappToken; //pass down smart contract
    daiToken = _daiToken;
  }

  // stake tokens (investor deposits)
  function stakeTokens(uint _amount) public {
    // transfer DAI through this contract into Token Farm
    daiToken.transferFrom(msg.sender, address(this), _amount);

    //update staking balance
    stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

    // add user to stakers array if they haven't
    if(!hasStaked[msg.sender]) {
      stakers.push(msg.sender);
    }

    //update staking status
    isStaking[msg.sender] = true;
    hasStaked[msg.sender] = true;

  }
  //unstaking tokens (withdraw)

  //issuing tokens (interest)
}
