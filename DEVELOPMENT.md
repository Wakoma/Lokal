# Ansible

`import_role` will make all its variables visible to everyone because it includes the role during compile time
`include_role` controls the visibility with `public=true|false`