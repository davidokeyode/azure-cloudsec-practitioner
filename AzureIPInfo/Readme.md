
### REFERENCE
* https://www.azurespeed.com/Azure/IPLookup

### Lookup by domain name
```
Invoke-WebRequest https://www.azurespeed.com/api/ipinfo?ipAddressOrUrl=<URL> -UseBasicParsing | Select-Object -ExpandProperty Content | jq

Invoke-WebRequest https://www.azurespeed.com/api/ipinfo?ipAddressOrUrl=xxxxxxxxx.yyyyyyyyy -UseBasicParsing | Select-Object -ExpandProperty Content | jq
```

### Lookup by IPv4 address
```
Invoke-WebRequest https://www.azurespeed.com/api/ipinfo?ipAddressOrUrl=<IPv4_ADDRESS> -UseBasicParsing | Select-Object -ExpandProperty Content | jq

Invoke-WebRequest https://www.azurespeed.com/api/ipinfo?ipAddressOrUrl=X.X.X.X -UseBasicParsing | Select-Object -ExpandProperty Content | jq
```


## Lookup by IPv6 address
```
Invoke-WebRequest https://www.azurespeed.com/api/ipinfo?ipAddressOrUrl=<IPv6_ADDRESS> -UseBasicParsing | Select-Object -ExpandProperty Content | jq
```

