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

M = magic(234);

[maxValue, linearIndexesOfMaxes] = max(M(:));
[rowsOfMaxes, colsOfMaxes] = find(M == maxValue);

disp(['The maximum value inside the matrix is: ', ...
    num2str(M(rowsOfMaxes, colsOfMaxes))])

[maximum, row, col] = findMaximum(M);

disp(['The maximum value found inside the matrix is: ', ...
    num2str(M(row, col))])

%% Function definition

function [maximum, row, col] = findMaximum(matrix)
    
    dimensions = size(matrix);
    numberOfRows = dimensions(1);
    numberOfColumns = dimensions(2);
    
    maximum = matrix(1, 1);

    for i=1:numberOfRows
        for j = 1:numberOfColumns
            if maximum <= matrix(i, j)
                maximum = matrix(i, j);
            end
        end
    end

    [row, col] = find(matrix == maximum);
end