CREATE TABLE IF NOT EXISTS material_impacts_per_kg (
    material_id text NOT NULL,
    co2_kg_eq numeric NOT NULL,
    water_use_l numeric NOT NULL,
    fossil_resources_use_mj numeric NOT NULL,
    PRIMARY KEY (material_id)
);

INSERT INTO material_impacts_per_kg (material_id, co2_kg_eq, water_use_l, fossil_resources_use_mj)
VALUES
    ('WOOD', 0.15, 30, 5),
    ('STEEL', 2.0, 140, 35),
    ('FABRIC', 2.5, 15000, 3),
    ('PLASTIC', 3.0, 50, 80),
    ('ALUMINUM', 12.0, 500, 175),
    ('GLASS', 1.0, 15, 16),
    ('CONCRETE', 0.4, 150, 1.5),
    ('RUBBER', 3.5, 2000, 65),
    ('COPPER', 4.0, 500, 40),
    ('CARBON_FIBER', 22.5, 100, 200),
    ('TITANIUM', 40.0, 200, 300),
    ('LEATHER', 6.0, 17500, 40),
    ('CERAMIC', 0.85, 5, 8),
    ('FOAM', 3.0, 75, 105),
    ('POLYMER', 4.0, 100, 90)
ON CONFLICT (material_id) DO UPDATE
SET
    co2_kg_eq = EXCLUDED.co2_kg_eq,
    water_use_l = EXCLUDED.water_use_l,
    fossil_resources_use_mj = EXCLUDED.fossil_resources_use_mj;
