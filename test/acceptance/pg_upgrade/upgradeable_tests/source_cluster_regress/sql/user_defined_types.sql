-- Copyright (c) 2017-2022 VMware, Inc. or its affiliates
-- SPDX-License-Identifier: Apache-2.0

-- Test to ensure that a few user defined types and the objects using those
-- types can be upgraded.

--------------------------------------------------------------------------------
-- Create and setup upgradeable objects
--------------------------------------------------------------------------------
CREATE DOMAIN some_check AS text CHECK (value ~ '^[1-9][0-9]-[0-9]{3}$');
CREATE TYPE some_state AS ENUM ('warmup', 'qualify', 'race');
CREATE TABLE some_table (id integer, sc some_check, ss some_state);
INSERT INTO some_table VALUES
	(1, '10-100', 'warmup'),
	(2, '20-200', 'qualify'),
	(3, '30-300', 'race');

