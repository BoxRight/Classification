law LeyDelNotariado
authority administrative

vocabulary
    verb provide: provide

parties
    Notary: Notary Corp, legal person
    NonSpanishSpeaker: NonSpanishSpeaker Person, natural person
    Interpreter: Interpreter Person, natural person

objects
    Deed: service
    InterpretationService: service

article 1 Generated
    fact certification NotarialDeedExecution is present
    obligation Notary must provide InterpretationService to Interpreter.
    obligation Interpreter must provide InterpretationService to NonSpanishSpeaker.
    obligation Interpreter must provide Deed to Notary.
    rule InterpreterRequirementRule
        If NonSpanishSpeaker fails to perform SpanishLanguageProficiency and certification NotarialDeedExecution is present
        then Notary must provide InterpretationService to Interpreter.
    procedure NotarialInterpretationProcedure:
        Notary provides InterpretationService to Interpreter.
        Interpreter provides InterpretationService to Notary.
        Notary provides Deed to Interpreter.
        Interpreter provides Deed to NonSpanishSpeaker.
        Interpreter provides Deed to Notary.