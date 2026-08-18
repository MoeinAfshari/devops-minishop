# Bridge Network

1. Default bridge: When you start Docker, a default bridge network (also called `bridge`) is created automatically, newly-started containers connect to it unless otherwise specified.
- Setup: Built automatically when you install Docker. Containers join it unless you pick another one.
- Communication: Containers can talk only via internal  IP address, not by name, unless using deprecated link methods.
- Flexibility: Hard to configure; changing settings requires restarting the main Docker daemon.
- Security: Less secure because all default-network containers sit in one shared space without clear group rules.
2. Custom bridge: User-defined bridge (custom bridge) network are superior to the default `bridge network.
- Setup: Created manually usding the `docker network create` command.
- Communication: Features automatic embedded DNS, so containers resolve and talk to each other by their container names.
- Flexibility: Fully configurable per network (custom subnets, gateways, and isolated groups).
- Security: Highly secure and clean; you can segment different applications (like putting a web app and database on one custom network and leaving others out).
3. Gateway: Every container has a default interface address (it's virtual) in the first.
Find default gateway inside a container: 
  1. `docker exec -it app1 sh` (Go to the container)
  2. `ip route show` | `route -n` (Shows default gateway)
  3. `ip route del default` (Deletes default gateway)
  4. `ip route add default via new_IP` (Adds new default gateway IP)
4. Subnet: A container subnet is a spedific range of private IP addresses assigned to a local or cloud container network. It lets containers talk to each other while keeping them separate from other networks.
