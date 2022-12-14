%-------------------------------------------------------------------------%
%   __  __    _  _____ _        _    ____    _  _      ____    _ ____     %
%  |  \/  |  / \|_   _| |      / \  | __ )  | || |    / ___|__| |  _ \    %
%  | |\/| | / _ \ | | | |     / _ \ |  _ \  | || |_  | |   / _` | |_) |   %
%  | |  | |/ ___ \| | | |___ / ___ \| |_) | |__   _| | |__| (_| |  __/    %
%  |_|  |_/_/   \_\_| |_____/_/   \_\____/     |_|    \____\__,_|_|       %
%                                                                         %
%-------------------------------------------------------------------------%
%                                                                         %
%   Author: Marco Mehl <marco.mehl@polimi.it>                             %
%           Timoteo Dinelli <timoteo.dinelli@polimi.it>                   %
%   CRECK Modeling Group <http://creckmodeling.chem.polimi.it>            %
%   Department of Chemistry, Materials and Chemical Engineering           %
%   Politecnico di Milano                                                 %
%   P.zza Leonardo da Vinci 32, 20133 Milano                              %
%                                                                         %
% ----------------------------------------------------------------------- %

clear, close, clc;

Matrix1 = [1 2 3 78; 2 3 4 7; 5 7 6 5];
Matrix2 = [55 89 57 1; 3 5 6 2; 76 847 1283 56; 76 847 1283 56];

myResult = ProductMatrix(Matrix1, Matrix2);
matlabResult = Matrix1 * Matrix2;

disp('My Product Function')
disp(myResult)
disp('Matlab Product Function')
disp(matlabResult)
%% Function Definition


function PM = ProductMatrix(A, B)

    [nr1, nc1] = size(A);
    [nr2, nc2] = size(B);

    PM = ones(nr1, nc2);

    if nc1 == nr2
        for i=1:nr1 % Index scanning the rows of the first matrix
            for j=1:nc2 % Index scanning the columns of the second matrix
                sum = 0; % Temporary variable to save results 
                for h=1:nc1 % Index scanning the columns of the first 
                            % matrix that have to be equal to the rows of
                            % the second matrix
                    sum = sum + A(i,h) * B(h, j); % Make multiplication and sum 
                end
                PM(i, j) = sum; % Store values inside an additional matrix 

            end
        end
    else % Error if inner dimensions do not agree
        error(['Inner dimensions must agree: available operation' ...
            '(a, b) X (c, d) if b == c'])
    end
end




