-- Copyright (c) 2017-2022 VMware, Inc. or its affiliates
-- SPDX-License-Identifier: Apache-2.0

-- Test to ensure that various flavors of user-defined aggregates can be
-- upgraded.

--------------------------------------------------------------------------------
-- Create and setup upgradeable objects
--------------------------------------------------------------------------------

-- Basic user defined aggregate
CREATE AGGREGATE sum_plus_42 (
   sfunc1 = int4pl, basetype = int4, stype1 = int4, initcond1 = '42'
);

-- Polymorphic user defined aggregate
CREATE AGGREGATE array_accum (anyelement)
(
    sfunc = array_append,
    stype = anyarray,
    initcond = '{}'
);
