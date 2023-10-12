from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2, ElasticContainerService
from diagrams.aws.database import RDS, ElasticacheForRedis
from diagrams.aws.network import ELB, VPC, NATGateway
from diagrams.onprem.network import Internet
from diagrams.aws.compute import EC2AutoScaling
from diagrams.aws.storage import ElasticFileSystemEFSFileSystem
from diagrams.aws.security import WAF, IAMRole, SecretsManager
from diagrams.aws.general import Users
from diagrams.aws.management import Cloudwatch
from diagrams.aws.network import Route53
from diagrams.aws.security import ACM
from diagrams.aws.integration import SNS
from diagrams.aws.devtools import Codepipeline, Codebuild, Codedeploy
from diagrams.aws.enablement import CustomerEnablement
from diagrams.aws.engagement import SimpleEmailServiceSesEmail

with Diagram("Infrastructure Diagram with AWS CloudZone", show=False):
    user = Users("User")
    developer = CustomerEnablement("Developer")
    sendemail = SimpleEmailServiceSesEmail("Email-Notification")
    with Cluster("AWS CloudZone"):
        waf = WAF("App-Firewall")
        route53 = Route53("DNS Zone")
        acm = ACM("Cert Manager")
        cloudwatch = Cloudwatch("CloudWatch")
        iam = IAMRole("ServiceAccount of ECS")
        sns = SNS("Notification")
        secret = SecretsManager("App Secret")
        with Cluster("Continues Integration"):
            codepipeline = Codepipeline("Source Stage")
            codebuild = Codebuild("Building App Stage")
            codedeploy = Codedeploy("Deplloy App Stage")
        with Cluster("VPC"):
            with Cluster("Private Subnet"):
                cache = ElasticacheForRedis("Redis-session")
                efs = ElasticFileSystemEFSFileSystem("Media-EFS")
                rds = RDS("DB-Server")
                with Cluster("Scale"):
                    ecs = ElasticContainerService("ECS: App-node1")
                    ecs1 = ElasticContainerService("ECS: App-node2")
                    autoscale =EC2AutoScaling("App-AutoScale-Group")
            with Cluster("Public Subnet"):
                lb = ELB("Application LB")
                nat = NATGateway("NAT Gateway")
                bastion = EC2("Bastion Host")

        bastion
        nat >> rds
        lb  >> ecs
        lb  >> ecs1
        ecs >> cache 
        ecs1>> cache
        ecs1>> rds
        ecs >> rds
        ecs >> efs
        ecs1>> efs
        user>> route53
        route53 >> acm
        acm>> waf
        developer   >> codepipeline
        codepipeline >> codebuild
        codebuild >> codedeploy
        codedeploy >> ecs1
        codedeploy >> ecs
        codebuild >> secret
        waf >> lb
        cloudwatch >> sns
        sns >> sendemail
