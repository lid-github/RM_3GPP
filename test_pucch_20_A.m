function test_pucch_20_A(varargin)

if nargin == 0
    code_length = 13;
elseif nargin == 1
    code_length = varargin{1};
end

if code_length > 13
    disp('code length is forced to be 11.');
    code_length = 13;
end

x = randi([0, 1], 1, code_length);

disp(x);

y = LTE_pucch_20_A_encode(x);

tx_symbols = 1 - 2 * y;

decoded_bits = LTE_pucch_20_A_decode(tx_symbols, code_length);

disp(decoded_bits);

if isequal(decoded_bits, x)
    disp('test passed.');
else
    disp('test failed.');
end

end