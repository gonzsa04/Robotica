% Retrieves an object from the object library.
%
% USAGE:  [vert, edge, nvert, nedge] = objlib(n)
%
%      vert = object vertex array  [4 x nvert]
%      edge = object edge connectivity [nedge x 2]
%     nvert = number of vertices
%     nedge = number of edges
%
%  If n is not specified, user is prompted.
%
% All objects fit inside a 10 unit cube.
%
% See also: objdef, objplot, uinew

function [vert, edge, nvert, nedge] = objlib(n)


if nargin==0
  fprintf('The following objects are available:\n')
  fprintf('  1.  Cube\n');
  fprintf('  2.  4-sided Pyramid\n');
  fprintf('  3.  Wedge\n');
  fprintf('  4.  Block letter F\n');
  n = input('Enter object number :');
end

if (n < 1) | (n > 4)
  error('Object number is illegal.')
end

if n == 1            % 10 UNIT CUBE
  vert = ones(4,8);
  vert = [ 0 5 5 0 0 5 5 0;
           0 0 5 5 0 0 5 5;
           0 0 0 0 5 5 5 5; ones(1,8)];
  edge = [1 2; 2 3; 3 4; 4 1;
          1 5; 2 6; 3 7; 4 8;
          5 6; 6 7; 7 8; 8 5];
  nvert = 8; nedge = 12;
end

if n == 2            % PYRAMID
  vert = ones(4,5);
  vert = [ 5 -5 -5  5 0;
           5  5 -5 -5 0;
           0  0  0  0 10; ones(1,5)];
  edge = [1 2; 2 3; 3 4; 4 1;
          1 5; 2 5; 3 5; 4 5];
  nvert = 5; nedge = 8;
end

if n == 3            % WEDGE
  vert = ones(4,5);
  vert = [ 8  0  0  8 0;
           4  4 -4 -4 0;
           0  0  0  0 6; ones(1,5)];
  edge = [1 2; 2 3; 3 4; 4 1;
          1 5; 2 5; 3 5; 4 5];
  nvert = 5; nedge = 8;
end

if n == 4            % BLOCK LETTER F
  vert = ones(4,20);
  vert = [ 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1;
           0 0 3 3 1 1 2 2 1 1 0 0 3 3 1 1 2 2 1 1;
           0 6 6 5 5 3 3 2 2 0 0 6 6 5 5 3 3 2 2 0;
           ones(1,20)];
  edge = [1 2; 2 3; 3 4; 4 5; 5 6; 6 7; 7 8; 8 9; 9 10; 10 1;
          1 11; 2 12; 3 13; 4 14; 5 15; 6 16; 7 17; 8 18; 9 19;10 20;
          11 12; 12 13; 13 14; 14 15; 15 16; 16 17; 17 18; 18 19; 19 20; 20 11];     
  nvert = 20; nedge = 30;
end


end
