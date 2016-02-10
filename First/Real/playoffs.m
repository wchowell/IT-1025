% Program to determine the winning odds of a multiple game series
% Specifically, looking at baseball playoff series

% Win percentage of teams, based on season record
% This percentage will be handled in two different ways
%    (1) Strictly based on a single team
%    (2) Based on a normalized winning percentage

WinPerA = 0.60;
WinPerB = 0.75;

% 5 game series (best of 5)
NumGames = 7;
NumSeries = 100000;

% Use a matrix to keep game log, 1 for win, 0 for lose

% Get game result
% Convert to wins and loses i.e. 1's and 0's
GameResults = rand(NumSeries, NumGames) < WinPerA;

% Get results
SeriesResults = sum(GameResults, 2) > 2;
NumSeriesWins = sum(SeriesResults);

% Determine Series Win Probability

WinProb = NumSeriesWins/NumSeries;

% Generate series win probs for a range of Win Percentages
WinPerRange = [0:0.05:1];
for lcv = 1:length(WinPerRange)
    SWP(lcv) = SeriesWinProb(NumGames, WinPerRange(lcv), NumSeries);
end

% Now, let's generate the theoretical results using binomial pdf x out of n with success p
% For 7 game series

for lcv = 1:length(WinPerRange)
    temp4 = binopdf(4,7,WinPerRange(lcv));
    temp5 = binopdf(5,7,WinPerRange(lcv));
    temp6 = binopdf(6,7,WinPerRange(lcv));
    temp7 = binopdf(7,7,WinPerRange(lcv));

    SWP_t1(lcv) = temp4 + temp5 + temp6 + temp7;
end


for lcv = 1:length(WinPerRange)
    wp = WinPerRange(lcv);
    temp = binopdf([4 5 6 7],[7 7 7 7],[wp wp wp wp]);

    SWP_t2(lcv) = sum(temp);
end








