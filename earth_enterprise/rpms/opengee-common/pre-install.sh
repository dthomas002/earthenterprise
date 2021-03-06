#! /bin/bash
#
# Copyright 2017 the Open GEE Contributors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set +x

#------------------------------------------------------------------------------
check_group()
{
    local GROUP_EXISTS=$(getent group "$GEGROUP")

    # Add group if it does not exist:
    if [ -z "$GROUP_EXISTS" ]; then
        groupadd -r "$GEGROUP" &> /dev/null
    fi
}


#-----------------------------------------------------------------
# Main Function
#-----------------------------------------------------------------
# 8) Check if group and users exist

# only if we are going to install, added as pre so cpio can carry
# group name if needed.  skip if upgrade.
if [ "$1" = "1" ]; then
    check_group
fi
#-----------------------------------------------------------------
