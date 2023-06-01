Role Name
=========

This Ansible role installs Zotero, a powerful reference management tool, on Linux systems. Zotero allows researchers, scholars, and academics to collect, organize, and cite research materials in various formats, making it an invaluable tool for managing references and citations.

Requirements
------------

This role requires Java Runtime Environment (JRE).

Role Variables
--------------

The role does not have any mandatory variables. However, you can customize the installation by modifying the following optional variables:

- `zotero_pkg_release`: Specifies the version of Zotero to install. By default, version `6.0.26` will be installed.

- `zotero_install_target`: Defines the directory where Zotero will be installed. The default installation directory is `/opt/zotero`.

Dependencies
------------

This role does not have any external dependencies.


Example Playbook
----------------

To use this role in your playbook, include the following YAML snippet:

    - hosts: servers
      roles:
         - { role: ouailderghal1.zotero, zotero_pkg_release: 6.0.25 }
         
License
-------

MIT

Author Information
------------------

This role was created by Ouail Derghal. Feel free to contact me at <ouailderghal1@gmail.com> for any questions or suggestions.

I hope this role simplifies the installation of Zotero and enhances your research workflow. Happy referencing!
