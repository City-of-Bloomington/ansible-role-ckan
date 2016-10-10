# CKAN
Role for maintaining CKAN installations on Ubuntu

## Requirements
- City-of-Bloomington.linux
- City-of-Bloomington.apache
- City-of-Bloomington.wsgi
- City-of-Bloomington.postgresql

## Dependencies
- City-of-Bloomington.solr

## Example Playbook
```yml
- hosts: linux-ckan
  become: yes
  roles:
    - City-of-Bloomington.linux
    - City-of-Bloomington.apache
    - City-of-Bloomington.wsgi
    - City-of-Bloomington.postgresql
    - City-of-Bloomington.ckan
```

# Copying and License
This material is copyright 2016 City of Bloomington, Indiana
It is open and licensed under the GNU General Public License (GLP) v3.0 whose full text may be found at:
https://www.gnu.org/licenses/gpl.txt
