// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

contract PokeCatcher {
  mapping(string => Owned) public ownership;

  struct Owned {
    address owner;
    bool owned;
  }

  constructor() public {}

  // Capturar
  function capture(string memory pokemonName) public returns (string memory) {
    require(!ownership[pokemonName].owned); 

    ownership[pokemonName].owner = msg.sender;
    ownership[pokemonName].owned = true;

    return pokemonName;
  }

  // Verificar si está capturado
  function isOwned(string memory pokemonName) public view returns (bool) {
    return ownership[pokemonName].owned;
  }
  

  // obtener dueño 
  function getOwner(string memory pokemonName) public view returns (address) {
    return ownership[pokemonName].owner;
  }
}
