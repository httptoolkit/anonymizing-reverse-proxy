# Anonymizing-Reverse-Proxy

> _Part of [HTTP Toolkit](https://httptoolkit.tech): powerful tools for building, testing & debugging HTTP(S)_

An anonymizing reverse proxy, used within HTTP Toolkit when communicating with 3rd party services from end-user devices.

---

It's almost impossible to use many 3rd party services in full compliance with GDPR, even if no personal data is involved, as all client-side interactions leak your IP address to the service.

Even if the 3rd party promises to not to store or to anonymize this, it's still considered to be receiving & processing personal data, and GDPR makes it clear that this requires justification and/or explicit consent. And even when justified, it's not great to be leaking personal data unnecessarily.

This is especially problematic if the service is based in the US or backed by a US company, as many are, in which case this can be considered as sending user data outside of a GDPR-compatible jurisdiction, something which is slowly but surely being [confirmed as illegal](https://www.isgoogleanalyticsillegal.com/) across the EU.

To avoid all this, HTTP Toolkit hosts an instance of the service in this repo, which acts as a reverse proxy for certain 3rd party services, forwarding packets upstream without directly exposing the end user to the 3rd party as the source of the traffic (and eliminating various other tracking avenues, e.g. TLS & HTTP fingerprinting).

Whilst reverse proxies generally include the client's full IP address in the forwarded headers, this proxy strips out the last octet of the IP address, making it impossible to recognize individual users from headers too. From the point of view of the 3rd party service, all requests appear to come from the proxy, not the user, and the data shared is only sufficient for approximate localization (important for some use cases) but not individual user identification or tracking.

(Of course, this all assumes that the actual content of the request is otherwise anonymous. That part is handled elsewhere, depending on the service in question).