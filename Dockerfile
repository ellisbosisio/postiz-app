FROM ghcr.io/gitroomhq/postiz-app:v2.11.3

RUN node -e "\
const fs = require('fs');\
const {execSync} = require('child_process');\
const files = execSync('grep -rl rw_organization_admin /app --include=\"*.js\"').toString().trim().split('\n');\
files.forEach(f => {\
  let c = fs.readFileSync(f, 'utf8');\
  c = c.replace(/[\"']r_basicprofile[\"']\s*,\s*/g, '');\
  c = c.replace(/[\"']rw_organization_admin[\"']\s*,\s*/g, '');\
  c = c.replace(/[\"']w_organization_social[\"']\s*,\s*/g, '');\
  c = c.replace(/,\s*[\"']r_organization_social[\"']/g, '');\
  fs.writeFileSync(f, c);\
});"
