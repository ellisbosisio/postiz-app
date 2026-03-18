FROM ghcr.io/gitroomhq/postiz-app:v2.11.3

RUN grep -rl rw_organization_admin /app --include="*.js" | xargs sed -i \
  -e 's/"r_basicprofile",//g' \
  -e 's/"rw_organization_admin",//g' \
  -e 's/"w_organization_social",//g' \
  -e 's/,"r_organization_social"//g' \
  -e "s/'r_basicprofile',//g" \
  -e "s/'rw_organization_admin',//g" \
  -e "s/'w_organization_social',//g" \
  -e "s/,'r_organization_social'//g"
