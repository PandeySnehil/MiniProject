// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EHR {
    struct Record {
        string data;
        uint timestamp;
    }

    struct Patient {
        mapping(address => bool) authorizedProviders;
        mapping(uint => Record) records;
        uint recordCount;
    }

    mapping(address => Patient) public patients;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function addRecord(string memory _data) public {
        Patient storage patient = patients[msg.sender];
        patient.records[patient.recordCount] = Record(_data, block.timestamp);
        patient.recordCount++;
    }

    function getRecord(address _patientAddress, uint _recordIndex) public view returns (string memory, uint) {
        require(patients[_patientAddress].authorizedProviders[msg.sender] || _patientAddress == msg.sender, "Not authorized");
        Record memory record = patients[_patientAddress].records[_recordIndex];
        return (record.data, record.timestamp);
    }

    function authorizeProvider(address _providerAddress) public {
        patients[msg.sender].authorizedProviders[_providerAddress] = true;
    }

    function revokeProvider(address _providerAddress) public{
        patients[msg.sender].authorizedProviders[_providerAddress] = false;
    }

    function isAuthorized(address _patientAddress, address _providerAddress) public view returns (bool){
        return patients[_patientAddress].authorizedProviders[_providerAddress];
    }
}