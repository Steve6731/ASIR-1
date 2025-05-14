_________________
**Port Security**
=================
## Pasos de configura Port Security
1. Habilitar port-security
2. poner el maximo nº de macs
3. poner como va a aprender las macs
4. Que hacer ante violacia de seguridad

```sql
--Set violation mode
switchport port-security violation [mode]
--Maximum adresses
switchport port-security maximum [num]
--definir MAC seguras
switchport port-security mac-address sticky dirección-mac
--Sticky learning
switchport port-security mac-address sticky     (habilita)
no switchport port-security mac-address sticky  (inhabilita)
--set aging time
switchport port-security aging time [num(minutes)]
```
_________________
**SNOOPING DHCP**
=================
```sql
show ip dhcp snooping binding
--1 habilitar DHCP snooping
ip dhcp snoping
ip dhcp snoping vlan [vlan]
no ip dhcp snoping informacion option
--2 Escoger puertos confiables
ip dhcp snooping trust
--3 limitar velocidad(tasa peticiones)
ip dhcp snooping limit rate [nº paquetes/segundo]
```
__________________________
**Dynamic arp inspection**
==========================
```sql
show ip arp inspection interfaces
ip arp inspection vlan numero
ip arp inspection trust
ip arp inspection validate dst-mac src-mac ip
```