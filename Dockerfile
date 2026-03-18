FROM ghcr.io/gitroomhq/postiz-app:v2.11.3

RUN find /app -name "*.js" -type f | xargs grep -l "rw_organization_admin" | while read f; do \
      sed -i 's/this\.scopes=\["openid","profile","w_member_social","r_basicprofile","rw_organization_admin","w_organization_social","r_organization_social"\]/this.scopes=["openid","profile","w_member_social"]/g' "$f"; \
    done
