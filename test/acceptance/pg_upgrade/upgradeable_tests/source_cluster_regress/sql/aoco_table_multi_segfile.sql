-- Copyright (c) 2017-2022 VMware, Inc. or its affiliates
-- SPDX-License-Identifier: Apache-2.0

-- Test to ensure that AOCO tables with multiple segfiles can be upgraded
-- successfully. Multiple sessions are utilized to create multiple segfiles.

--------------------------------------------------------------------------------
-- Create and setup upgradeable objects
--------------------------------------------------------------------------------
CREATE TABLE aoco_users (id integer, name text) WITH (appendonly=true, orientation=column) DISTRIBUTED BY (id);
1:BEGIN;
1:INSERT INTO aoco_users VALUES (1, 'Jane');
1:INSERT INTO aoco_users VALUES (2, 'John');

2:BEGIN;
2:INSERT INTO aoco_users VALUES (3, 'Joe');

1:END;
2:END;
