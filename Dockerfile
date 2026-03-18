FROM ghcr.io/gitroomhq/postiz-app:v2.11.3

RUN find /app -name "*.js" -exec grep -l rw_organization_admin {} + | while read f; do \
      sed -i 's/"r_basicprofile",//g;s/"rw_organization_admin",//g;s/"w_organization_social",//g;s/,"r_organization_social"//g' "$f"; \
      sed -i "s/'r_basicprofile',//g;s/'rw_organization_admin',//g;s/'w_organization_social',//g;s/,'r_organization_social'//g" "$f"; \
    done
