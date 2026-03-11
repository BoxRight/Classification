law ContratoPatrocinio
authority private

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Patrocinado: Patrocinado Corp, legal person
    Patrocinador: Patrocinador Corp, legal person

objects
    Contraprestacion: money
    PropiedadIndustrial: service
    BeneficiosPatrocinador: service
    Banner1: service
    Banner2: service
    PresenciaMateriales: service
    BoletosObsequio: service

article 1 Generated
    fact asset ContratoPatrocinio is present
    obligation Patrocinador must pay Contraprestacion to Patrocinado.
    obligation Patrocinado must provide BeneficiosPatrocinador to Patrocinador.
    obligation Patrocinado must provide PropiedadIndustrial to Patrocinador.
    prohibition Patrocinado must not fail PropiedadIndustrial.
    procedure BeneficiosPatrocinio:
        Patrocinado provides Banner1 to Patrocinador.
        Patrocinado provides Banner2 to Patrocinador.
        Patrocinado provides PresenciaMateriales to Patrocinador.
        Patrocinado provides BoletosObsequio to Patrocinador.