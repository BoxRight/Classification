law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    OpposingParty: OpposingParty Person, natural person

objects
    AppealResource: service
    NullityIncident: service
    TestimonyCopies: movable

article 1 Generated
    fact certification LeaseDispute is present
    fact certification NullityIncidentFiled is present
    fact certification AppealFiled is present
    claim Defendant may demand AppealResource from Judge.
    obligation Judge must provide AppealResource to Defendant.
    rule AppealAdmissionRule
        If certification AppealFiled is present
        then Judge must provide AppealResource to Defendant.
    rule DevolutiveEffectRule
        If certification AppealAdmitted is present
        then Judge must transfer TestimonyCopies to OpposingParty.
    procedure AppealProcedure:
        Defendant provides AppealResource to Judge.
        Judge provides AppealResource to Defendant.
        Judge transfers TestimonyCopies to OpposingParty.