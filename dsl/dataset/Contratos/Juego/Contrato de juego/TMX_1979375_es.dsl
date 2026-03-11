law ContratoJuego
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Player1: Player1 Person, natural person
    Player2: Player2 Person, natural person
    Referee: Referee Person, natural person
    Witness1: Witness1 Person, natural person
    Witness2: Witness2 Person, natural person

objects
    TournamentPrize: money
    ExpensesAllowance: money
    TournamentDiploma: service
    GamePerformance: service

article 1 Generated
    fact certification GameContract is present
    obligation Player1 must provide GamePerformance to Player2.
    obligation Player2 must provide GamePerformance to Player1.
    obligation Referee must provide GamePerformance to Player1.
    rule WinnerPrizeRule
        If certification GameContract is present
        then Player1 may demand TournamentPrize from Player2.
    rule ExpensesRule
        If certification GameContract is present
        then Player1 may demand ExpensesAllowance from Player2.
    procedure GameTournament:
        Player1 provides GamePerformance to Player2.
        Referee provides GamePerformance to Player1.