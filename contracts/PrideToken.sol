<<<<<<< HEAD

// SPDX-License-Identifier : MIT
pragma solidity ^0.8.20;

contract PrideToken {
    string public name = "PrideToken";
    string public symbol = "PRD";
    uint8 public decimals = 18;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address=>uint256)) private _allowances;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval (address indexed owner, address indexed spender, uint256 value);
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to zero address");
        _totalSupply += amount;
        _balances[account] +=amount;
        emit Transfer(address(0), account, amount);
        }
         constructor(uint256 initialSupply) {
        _mint(msg.sender, initialSupply*10**uint256(decimals));
        }
        function totalSupply() public view returns (uint256) {
         
            return _totalSupply;
        }
        function balanceOf(address account) public view returns (uint256) {
            return _balances[account];
        }
        function transfer(address to, uint256 amount) public returns (bool) {
            require (to!= address(0), "Invalid recipient address");
            require (amount <= _balances[msg.sender], "Insufficient balance");
            _balances[msg.sender]-= amount;
            _balances[to]+= amount;
            emit Transfer (msg.sender, to , amount);
            return true;
        }
        function allowance(address owner, address spender) public view returns (uint256) {
            return _allowances[owner][spender];

        }
        function approve(address spender, uint256 amount) public returns (bool) {
            require(spender !=address(0),"ERC20 : approve to zero address");
            _allowances[msg.sender][spender] = amount;
            emit Approval(msg.sender, spender, amount);
            return true;
        }
        function transferFrom(address from, address to, uint256 amount) public returns (bool) {
            require(to!= address(0), "Invalid recipient address");
            require(_balances[from] >= amount, "Insufficient balance");
            require(_allowances[from][msg.sender] >= amount, "same thing");
            _balances[from] -=amount;
            _balances[to] += amount;
            _allowances[from][msg.sender] -= amount;
            emit Transfer(from, to, amount);
            return true;
 
        }
        address public owner;
        modifier onlyowner() {
            require(msg.sender == owner, "Only owner can call this function");
            _;
        }
        function mint(address account, uint256 amount) public onlyowner {
            _mint(account, amount);
        }
        
        function burn(uint256 amount) public {
            require(amount <= _balances[msg.sender], "Insufficient balance");
            
            _balances[msg.sender] -= amount;
            _totalSupply -= amount;

            emit Transfer(msg.sender, address(0), amount);
        }
        function increaseAllowances(address spender, uint256 addedValue) public returns (bool) {
            _allownaces[msg.sender][spender] += addedValue;
            emit Approval(msg.sender, spender, _allownances[msg.sender][spender]);
            return true;
        }
        function decreaseAllowances(address spender, uint256 subtractedValue) public returns (bool) {
            uint256 currentAllowances = _allowances[msg.sender][spender];
            require(currentAllowances >= subtractedValue, "ERC20: decreased allowance below zero");
            _allowances[msg.sender][spender] = currentValue - substractedValue;
            emit Approval(msg.sender, spender, _allowances[msg.sender][spender]);
            return true;
        }
        bool public paused = false;
        modifier notPaused() {
            require(!paused, "Contract is paused");
            _;
        }
        function pause() public onlyowner {
            paused = true;
        }
        function unpause() public onlyowner {
            paused = false;
        }
        function transfer(address to, uint256 amount) public notPaused returns (bool) {
            require(to != address(0));
            require(_balances[msg.sender] >= amount);
            _balances[msg.sender] -= amount;
            _balances[to] += amount;
            emit Transfer(msg.sender, to, amount);
            return true;
        }
        function transferFrom(address from, address to, uint256 amount) public notPaused returns (bool) {
            require(to != address(0));
            require(_balances[from] >= amount);
            require(_allowances[from][msg.sender] >= amount);
            _allowances[from][msg.sender] -= amount;
            _balances[from] -= amount;
            _balances[to] += amount;
            emit Transfer(from, to, amount);
            return true;
        }

}
=======
// SPDX-License-Identifier : MIT
pragma solidity ^0.8.20;

contract PrideToken {
    string public name = "PrideToken";
    string public symbol = "PRD";
    uint8 public decimals = 18;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address=>uint256)) private _allowances;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval (address indexed owner, address indexed spender, uint256 value);
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to zero address");
        _totalSupply += amount;
        _balances[account] +=amount;
        emit Transfer(address(0), account, amount);
        }
         constructor(uint256 initialSupply) {
        _mint(msg.sender, initialSupply*10**uint256(decimals));
        }
        function totalSupply() public view returns (uint256) {
         
            return _totalSupply;
        }
        function balanceOf(address account) public view returns (uint256) {
            return _balances[account];
        }
        function transfer(address to, uint256 amount) public returns (bool) {
            require (to!= address(0), "Invalid recipient address");
            require (amount <= _balances[msg.sender], "Insufficient balance");
            _balances[msg.sender]-= amount;
            _balances[to]+= amount;
            emit Transfer (msg.sender, to , amount);
            return true;
        }
        function allowance(address owner, address spender) public view returns (uint256) {
            return _allowances[owner][spender];

        }
        function approve(address spender, uint256 amount) public returns (bool) {
            require(spender !=address(0),"ERC20 : approve to zero address");
            _allowances[msg.sender][spender] = amount;
            emit Approval(msg.sender, spender, amount);
            return true;
        }
        function transferFrom(address from, address to, uint256 amount) public returns (bool) {
            require(to!= address(0), "Invalid recipient address");
            require(_balances[from] >= amount, "Insufficient balance");
            require(_allowances[from][msg.sender] >= amount, "same thing");
            _balances[from] -=amount;
            _balances[to] += amount;
            _allowances[from][msg.sender] -= amount;
            emit Transfer(from, to, amount);
            return true;
 
        }
        address public owner;
        modifier onlyowner() {
            require(msg.sender == owner, "Only owner can call this function");
            _;
        }
        function mint(address account, uint256 amount) public onlyowner {
            _mint(account, amount);
        }
        
        function burn(uint256 amount) public {
            require(amount <= _balances[msg.sender], "Insufficient balance");
            
            _balances[msg.sender] -= amount;
            _totalSupply -= amount;

            emit Transfer(msg.sender, address(0), amount);
        }
        function increaseAllowances(address spender, uint256 addedValue) public returns (bool) {
            _allownaces[msg.sender][spender] += addedValue;
            emit Approval(msg.sender, spender, _allownances[msg.sender][spender]);
            return true;
        }
        function decreaseAllowances(address spender, uint256 subtractedValue) public returns (bool) {
            uint256 currentAllowances = _allowances[msg.sender][spender];
            require(currentAllowances >= subtractedValue, "ERC20: decreased allowance below zero");
            _allowances[msg.sender][spender] = currentValue - substractedValue;
            emit Approval(msg.sender, spender, _allowances[msg.sender][spender]);
            return true;
        }
        bool public paused = false;
        modifier notPaused() {
            require(!paused, "Contract is paused");
            _;
        }
        function pause() public onlyowner {
            paused = true;
        }
        function unpause() public onlyowner {
            paused = false;
        }
        function transfer(address to, uint256 amount) public notPaused returns (bool) {
            require(to != address(0));
            require(_balances[msg.sender] >= amount);
            _balances[msg.sender] -= amount;
            _balances[to] += amount;
            emit Transfer(msg.sender, to, amount);
            return true;
        }
        function transferFrom(address from, address to, uint256 amount) public notPaused returns (bool) {
            require(to != address(0));
            require(_balances[from] >= amount);
            require(_allowances[from][msg.sender] >= amount);
            _allowances[from][msg.sender] -= amount;
            _balances[from] -= amount;
            _balances[to] += amount;
            emit Transfer(from, to, amount);
            return true;
        }

}
>>>>>>> d3316d46eacabae28b114635e576391844e17552
