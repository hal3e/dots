# Copy this small file into your Fish conf.d directory. Launchers stay in the checkout.
# Set AGENT_TOOLKIT_ROOT before this file loads to use a different checkout path.
if not set -q AGENT_TOOLKIT_ROOT
    set -g AGENT_TOOLKIT_ROOT "$HOME/pro/agent-toolkit"
end

set -l agent_functions "$AGENT_TOOLKIT_ROOT/integrations/fish/functions"
if test -d "$agent_functions"
    if not contains -- "$agent_functions" $fish_function_path
        set -g -p fish_function_path "$agent_functions"
    end
end
