module "rama-poc" {
    source                  = "../terraform-modules/saj/rama-poc-modules"
    name                    = "rama-poc"
    region                  = var.region
    
    key_content              = file("./ssh_pubkey.pem")

    cidr_block              = "10.225.0.0/16"
    
    #pgkeycloak_password     = "SasEdc#$ddSASdf"

    auto_discovery_zones    = false
    desired_zones           = ["sa-east-1a", "sa-east-1c"]
    eks_tag_subnets         = true

    private_subnets          = [
        "10.225.0.0/20",
        "10.225.16.0/20"
    ]

    protected_subnets          = [
        "10.225.35.0/25",
        "10.225.35.128/25"
    ]
    
    
    public_subnets          = [
        "10.225.34.0/27",
        "10.225.34.32/27"
    ]

    tags = {
        TERRAFORM       = "true",
        ENVIRONMENT     = "rama-poc",
    }
}
