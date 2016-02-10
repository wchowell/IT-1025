% Program (First Cut) to determine optimal draft slot
% This determination will initially be made based upon the summation
%    of auction values (AV) 




% STEP 0:  Set Parameters
NumTeams = 12;
NumRounds = 16;


% STEP 1:  Read in data
% Name AV
% For now, only use the damn AV value because can't read in the names??? I know stupid
NumValuesNeeded = NumTeams * NumRounds;

 %fid  = fopen('avs.mat', 'r') ;
 %data = cell(1e6, 3) ;                    % Prealloc.
 %rCnt = 0 ;                               % Row counter.
 %while ~feof(fid)
 %   rCnt = rCnt + 1 ;
 %   data{rCnt,1} = fscanf(fid, '%s', 1) ;
 %   data{rCnt,2} = fscanf(fid, '%d', 1) ;
 %   %data{rCnt,3} = fscanf(fid, '%s', 1) ;
 %end
 %fclose(fid) ;
 %data = data(1:rCnt,:) ;                  % Truncate.
%

%fp = fopen('avs.mat','r');
%for lcv = 1: NumValuesNeeded%
%	PlayerName(lcv) = fscanf(fp,'%s');
	%PlayerValue(lcv) = fscanf(fp,'%d');
%end
%fclose(fp);


all = dlmread('AuctionValues2013.txt');
AVs = all(:,2);


%Moved this to step 0
% STEP 2:  Set Parameters
%NumTeams = 12;
%NumRounds = 20

% STEP 3:  Ensure players are sorted by AV
sortedAVs = sort(AVs,1 ,'descend');


% STEP 4:  Run a "draft"
% First attempt will be mearly assigning the values

odds = 1:2:NumRounds;
evens = 2:2:NumRounds;

% Odd round selection = TeamNum + (Round - 1) * NumTeams
% Even round selection = (Round * NumTeams) - (TeamNum - 1)
T1(odds) = 1 + (odds - 1) * NumTeams;
T1(evens) = evens * NumTeams - (1-1);

Teams = 1:3;
for team =1:NumTeams
	DraftOrder(team,odds) = team + (odds - 1) * NumTeams;
	DraftOrder(team,evens) = evens * NumTeams - (team-1);
end

% Draft Picks
DraftPicks = sortedAVs(DraftOrder);
DraftValue = sum(DraftPicks,2);




