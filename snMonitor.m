% function ret = snMonitor(info, xs, fCon, gObj, rc, pi, Ascale, rg, Prob)
%
% SNOPT Monitor Callback
%
% This routine is called by SNOPT (not snoptA) once for each major 
% iteration, providing a way for the user to stop optimization in a 
% controlled manner.
%
% Recommended use is to make a copy of this file and put first on your
% MATLAB path, then edit it with any desired extra stopping criteria.
% Always return a scalar double 0.0 if termination is not desired. 
% Any nonzero double value will stop SNOPT with Inform=74, returning the
% point from the last major iteration. 
%
%
% Inputs: 
%
% info       22x1 numerical information vector. Can be converted into a
%            more readable structure using the snInfoStruct sub-function  
%            provided at the end of this file.
%
% xs         Primal variables and slacks.
%
% fCon       Nonlinear constraint values
% gObj       Objective gradient
% rc         Reduced costs vector
% pi         Lagrange multiplier vector
% Ascale     Scaling factors for columns of linear constraints
% rg         Reduced gradient
% Prob       The Prob structure given in tomRun('snopt', Prob) call
%
%
% Outputs:
% 
% ret        Scalar return value. Stops optimization if nonzero. 
%

% Tomlab Optimization Inc., E-mail: tomlab@tomopt.com
% Copyright (c) 2015-2016 by Tomlab Optimization Inc., $Release: 8.2.0$
% Written May 20, 2015   Last modified Mar 16, 2016.

function ret = snMonitor(info, xs, fCon, gObj, rc, pi, Ascale, rg, Prob)

% If desired, call subfunction snInfoStruct for a comprehensible
% structure with solution quality/progress values
snInfo = snInfoStruct(info);

% Nonzero 'ret' terminates SNOPT run.
ret = 0;

return


% -------------------------------------------------------------------------
%
% function snInfo = snInfoStruct(info)
%
% Creates information structure from 22x1 'info' vector: 
%
%
% Field   Index  Description
% condHz      1  Lower bound on condition number of reduced Hessian
% sclObj      2  Objective scaling factor
% ObjAdd      3  Objective constant part
% fMerit      4  Augmented Lagrangian merit function value
% PenNrm      5  Norm of vector of penalty parameters
% viRel       6  Relative constraint violation
% viMax       7  Maximum constraint violation
% step        8  Step size in current major iteration
% prInf       9  Primal infeasibility
% duInf      10  Dual infeasibility
% KTCond  11:12  2x1-vector with flags telling primal and dual feasibility
% info    13:18  6x1-vector TBD
% nMajor     19  Number of major iterations
% nMinor     20  Number of minor iterations in last QP subproblem
% nS         21  Number of superbasics
% nSwap      22  Number of swaps in latest basis factorization

function snInfo = snInfoStruct(info)

snInfo = struct( ...
   'condHz' ,  info(1)    , 'sclObj' ,  info(2)  , ...
   'ObjAdd' ,  info(3)    , 'fMerit' ,  info(4)  , ...
   'PenNrm' ,  info(5)    , 'viRel'  ,  info(6)  , ...
   'viMax'  ,  info(7)    , 'step'   ,  info(8)  , ...
   'prInf'  ,  info(9)    , 'duInf'  ,  info(10) , ...
   'KTcond' ,  info(11:12), ...
   'info'   ,  info(13:18), ...
   'nMajor' ,  info(19)   , 'nMinor' , info(20), ...
   'nS'     ,  info(21)   , 'nSwap'  , info(22) );
