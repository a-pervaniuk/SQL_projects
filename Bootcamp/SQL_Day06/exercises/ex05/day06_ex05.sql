COMMENT ON TABLE person_discounts IS 'Таблица с процентом скидки для клиента в конкретной пиццерии';

COMMENT ON COLUMN person_discounts.id IS 'Идентификатор записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки для клиента в этой пиццерии';