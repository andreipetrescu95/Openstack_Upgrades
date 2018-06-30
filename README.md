OpenStack Upgrades
==================

This project proposes a solution to upgrade OpenStack through multiple releases.

Currently, the path that it follows is from Liberty to Queens.

For automation, we have used Puppet, but currently the classes are written in such a way that
they are applied by downloading them on each node and using **puppet apply**.

Future improvements:
- Ability to run them on something else than CentOS.
- Automatic configuration file management.

Contributions are welcome.