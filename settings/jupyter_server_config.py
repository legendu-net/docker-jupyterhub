import os
c = get_config()
#------------------------------------------------------------------------------
# permission 775 for new dirs (for easy sharing)
os.umask(0o002)
#------------------------------------------------------------------------------
#c.ServerApp.ResourceUseDisplay.track_cpu_percent = True
#------------------------------------------------------------------------------
print("\nSummary of Jupyter Configuration:\n", c, "\n", sep="")
