function y = binopdf(x,n,p)
% BINOPDF Binomial probability density function.
%   Y = BINOPDF(X,N,P) returns the binomial probability density 
%   function with parameters N and P at the values in X.
%   Note that the density function is zero unless X is an integer.
%
%   The size of Y is the common size of the input arguments. A scalar input  
%   functions as a constant matrix of the same size as the other inputs.    
%
%   See also BINOCDF, BINOFIT, BINOINV, BINORND, BINOSTAT, PDF.

%   Reference:
%      [1]  M. Abramowitz and I. A. Stegun, "Handbook of Mathematical
%      Functions", Government Printing Office, 1964, 26.1.20.

if nargin < 3, 
    error('stats:binopdf:TooFewInputs. This function Requires three input arguments');
end

%[errorcode x n p] = distchck(3,x,n,p);

%if errorcode > 0
%    error('stats:binopdf:InputSizeMismatch',...
%          'Requires non-scalar arguments to match in size.');
%end

% Initialize Y to zero.
if isa(x,'single') || isa(n,'single') || isa(p,'single')
   y = zeros(size(x),'single');
else
   y = zeros(size(x));
end
 
% Binomial distribution is defined on positive integers less than N.
if ~isfloat(x)
   x = double(x);
end
if ~isfloat(n)
   n = double(n);
end
k = find(x >= 0  &  x == round(x)  &  x <= n);
if any(k)
   % First deal with borderline cases
   t = (p(k)==0);
   if any(t)
      kt = k(t);
      y(kt) = (x(kt)==0);
      k(t) = [];
   end
   t = (p(k)==1);
   if any(t)
      kt = k(t);
      y(kt) = (x(kt)==n(kt));
      k(t) = [];
   end
end

if any(k)
   nk = gammaln(n(k) + 1) - gammaln(x(k) + 1) - gammaln(n(k) - x(k) + 1);
   lny = nk + x(k).*log( p(k)) + (n(k) - x(k)).*log1p(-p(k));
   y(k) = exp(lny);
end

k1 = find(n < 0 | p < 0 | p > 1 | round(n) ~= n); 
if any(k1)
   y(k1) = NaN;
end