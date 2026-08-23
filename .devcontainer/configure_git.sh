
# Check if Git email is configured
current_email=$(git config --global user.email || echo "")
current_name=$(git config --global user.name || echo "")

if [ -z "$current_email" ] || [ -z "$current_name" ]; then
    echo -e "${YELLOW}Do you want to configure Git user information?${NC}"
    echo -e "${BLUE}Note: This is only required if you use Git from the command line.${NC}"
    echo -e "${BLUE}If you only use Git through a GUI client, you can skip this.${NC}"
    echo -e "${GREEN}Configure Git user info? (Y/n):${NC}"
    read configure_git

    if [[ $configure_git =~ ^[Nn]$ ]]; then
        echo -e "${BLUE}Skipping Git user configuration${NC}"
    else
        if [ -z "$current_email" ]; then
            echo -e "${GREEN}Enter your Git email address (default: timothy.sabat@gmail.com):${NC}"
            read git_email
            git_email=${git_email:-"timothy.sabat@gmail.com"}
            git config --global user.email "$git_email"
        else
            echo -e "${BLUE}Git email already configured as:${NC} $current_email"
        fi

        if [ -z "$current_name" ]; then
            echo -e "${GREEN}Enter your Git name (default: tsabat):${NC}"
            read git_name
            git_name=${git_name:-"tsabat"}
            git config --global user.name "$git_name"
        else
            echo -e "${BLUE}Git name already configured as:${NC} $current_name"
        fi
    fi
else
    echo -e "${BLUE}Git user information already configured:${NC}"
    echo -e "${BLUE}Email:${NC} $current_email"
    echo -e "${BLUE}Name:${NC} $current_name"
fi

# Always set default branch to main
git config --global init.defaultBranch main

# Configure Git editor to vim
git config --global core.editor "vim"

# Configure Git editor and diff/merge tools
git config --global diff.tool "vimdiff"
git config --global merge.tool "vimdiff"
git config --global difftool.prompt false
git config --global merge.conflictstyle "diff3"
git config --global alias.d "difftool"

# Show diff in commit message editor
git config --global commit.verbose true
git config --global commit.status true
