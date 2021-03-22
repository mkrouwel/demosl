grammar demo;
reserved_term : COORDINATION_ACT_NAME | COORDINATION_FACT_NAME | SPECIAL_TERM;
COORDINATION_ACT_NAME : 'request' | 'promise' | 'declare' | 'accept' | 'decline' | 'reject' | 'revoke' | 'allow' | 'refuse';
COORDINATION_FACT_NAME : 'requested' | 'promised' | 'declared' | 'accepted' | 'declined' | 'rejected' | 'revoked' | 'allowed' | 'refused';
SPECIAL_TERM : 'performer' | 'addressee' | 'ct' | 'et' | 'ot' | 'now';

transaction_kind_id : TRANSACTION_KIND_ID;
multiple_transaction_kind_id : MULTIPLE_TRANSACTION_KIND_ID;
product_kind_id : PRODUCT_KIND_ID;
actor_role_id : ACTOR_ROLE_ID;
transactor_role_id : TRANSACTOR_ROLE_ID;
composite_transactor_role_id : COMPOSITE_TRANSACTOR_ROLE_ID;

TRANSACTION_KIND_ID : 'TK' DIGITS;
MULTIPLE_TRANSACTION_KIND_ID : 'MTK' DIGITS;
PRODUCT_KIND_ID : 'PK' DIGITS;
ACTOR_ROLE_ID : 'AR' DIGITS;
TRANSACTOR_ROLE_ID : 'TAR' DIGITS;
COMPOSITE_TRANSACTOR_ROLE_ID : 'CTAR' DIGITS;

transaction_kind_name : LOWERCASES;
multiple_transaction_bank_name : CAMEL | LOWERCASES;
actor_role_name : LOWERCASES;
entity_type_name : LOWERCASES;
object_class_name : UPPERCASES;
value_type_name : LOWERCASES;
value_class_name : '{' UPPERCASES '}';
property_type_name : LOWERCASES;
attribute_type_name : LOWERCASES;
event_type_name : LOWERCASES;
entity_name : ALPHAS | QUOTEDALPHAS;
value_name : ALPHAS | QUOTEDALPHAS;

entity_reference : definite_entity_reference | indefinite_entity_reference | indirect_entity_reference;
definite_entity_reference : entity_type_name entity_name;
definite_entity_references : definite_entity_reference+;
indefinite_entity_reference : 'some' entity_type_name;
indefinite_entity_references : indefinite_entity_reference+;
indirect_entity_reference : 'the' property_type_name (OIO (entity_reference | value_reference))+;
indirect_entity_references : indirect_entity_reference+;

entity_variable : '[' entity_type_name ']';
entity_variables : entity_variable+;
property_variable : 'the' property_type_name (OIO (entity_variable | property_variable | value_variable | attribute_variable))+;
property_variables : property_variable+;

value_reference : definite_value_reference | indefinite_value_reference | indirect_value_reference;
definite_value_reference : value_type_name value_name;
definite_value_references : definite_value_reference+;
indefinite_value_reference : 'some' value_type_name;
indefinite_value_references : indefinite_value_reference+;
indirect_value_reference : 'the' attribute_type_name (OIO (entity_reference | value_reference))+;
indirect_value_references : indirect_value_reference;

value_variable : '[' value_type_name ']';
value_variables : value_variable+;
attribute_variable : 'the' attribute_type_name (OIO (entity_variable | property_variable | value_variable | attribute_variable))+;
attribute_variables : attribute_variable+;

tpt_entry : transaction_kind_id transaction_kind_name '|' product_kind_id product_kind_formulation '|' actor_role_id actor_role_name;
tpt_entries : tpt_entry+;

perfect_tense : LOWERCASES;
product_kind_formulation : (entity_variable | property_variable | attribute_variable) 'is' perfect_tense;
product_kind_formulations : product_kind_formulation+;

bct_entry : ( (transaction_kind_id transaction_kind_name) | (multiple_transaction_kind_id multiple_transaction_bank_name) ) '|' (object_class_name | product_kind_formulation | property_variable | attribute_variable);
bct_entries : bct_entry+;

OIO : 'of' | 'in' | 'on';
LOWERCASES : [a-z_]+;
UPPERCASES : [A-Z_]+;
CAMEL : [A-Z][a-z_]+;
QUOTEDALPHAS : '\'' ALPHAS '\'';
DIGITS : [0-9]+;
LETTERS : [a-zA-Z_]+;
ALPHAS : [a-zA-Z0-9_]+;
WHITESPACE : [ \t\r\n]+ -> skip;