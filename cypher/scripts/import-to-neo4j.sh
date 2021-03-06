#!/bin/bash

$NEO4J_HOME/bin/neo4j-admin import \
  --id-type=INTEGER \
  --nodes=Place="${NEO4J_CSV_DIR}/static/place${NEO4J_CSV_POSTFIX}" \
  --nodes=Organisation="${NEO4J_CSV_DIR}/static/organisation${NEO4J_CSV_POSTFIX}" \
  --nodes=TagClass="${NEO4J_CSV_DIR}/static/tagclass${NEO4J_CSV_POSTFIX}" \
  --nodes=Tag="${NEO4J_CSV_DIR}/static/tag${NEO4J_CSV_POSTFIX}" \
  --nodes=Message:Comment="${NEO4J_CSV_DIR}/dynamic/comment${NEO4J_CSV_POSTFIX}" \
  --nodes=Forum="${NEO4J_CSV_DIR}/dynamic/forum${NEO4J_CSV_POSTFIX}" \
  --nodes=Person="${NEO4J_CSV_DIR}/dynamic/person${NEO4J_CSV_POSTFIX}" \
  --nodes=Message:Post="${NEO4J_CSV_DIR}/dynamic/post${NEO4J_CSV_POSTFIX}" \
  --relationships=IS_PART_OF="${NEO4J_CSV_DIR}/static/place_isPartOf_place${NEO4J_CSV_POSTFIX}" \
  --relationships=IS_SUBCLASS_OF="${NEO4J_CSV_DIR}/static/tagclass_isSubclassOf_tagclass${NEO4J_CSV_POSTFIX}" \
  --relationships=IS_LOCATED_IN="${NEO4J_CSV_DIR}/static/organisation_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_TYPE="${NEO4J_CSV_DIR}/static/tag_hasType_tagclass${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_CREATOR="${NEO4J_CSV_DIR}/dynamic/comment_hasCreator_person${NEO4J_CSV_POSTFIX}" \
  --relationships=IS_LOCATED_IN="${NEO4J_CSV_DIR}/dynamic/comment_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
  --relationships=REPLY_OF="${NEO4J_CSV_DIR}/dynamic/comment_replyOf_comment${NEO4J_CSV_POSTFIX}" \
  --relationships=REPLY_OF="${NEO4J_CSV_DIR}/dynamic/comment_replyOf_post${NEO4J_CSV_POSTFIX}" \
  --relationships=CONTAINER_OF="${NEO4J_CSV_DIR}/dynamic/forum_containerOf_post${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_MEMBER="${NEO4J_CSV_DIR}/dynamic/forum_hasMember_person${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_MODERATOR="${NEO4J_CSV_DIR}/dynamic/forum_hasModerator_person${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_TAG="${NEO4J_CSV_DIR}/dynamic/forum_hasTag_tag${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_INTEREST="${NEO4J_CSV_DIR}/dynamic/person_hasInterest_tag${NEO4J_CSV_POSTFIX}" \
  --relationships=IS_LOCATED_IN="${NEO4J_CSV_DIR}/dynamic/person_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
  --relationships=KNOWS="${NEO4J_CSV_DIR}/dynamic/person_knows_person${NEO4J_CSV_POSTFIX}" \
  --relationships=LIKES="${NEO4J_CSV_DIR}/dynamic/person_likes_comment${NEO4J_CSV_POSTFIX}" \
  --relationships=LIKES="${NEO4J_CSV_DIR}/dynamic/person_likes_post${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_CREATOR="${NEO4J_CSV_DIR}/dynamic/post_hasCreator_person${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_TAG="${NEO4J_CSV_DIR}/dynamic/comment_hasTag_tag${NEO4J_CSV_POSTFIX}" \
  --relationships=HAS_TAG="${NEO4J_CSV_DIR}/dynamic/post_hasTag_tag${NEO4J_CSV_POSTFIX}" \
  --relationships=IS_LOCATED_IN="${NEO4J_CSV_DIR}/dynamic/post_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
  --relationships=STUDY_AT="${NEO4J_CSV_DIR}/dynamic/person_studyAt_organisation${NEO4J_CSV_POSTFIX}" \
  --relationships=WORK_AT="${NEO4J_CSV_DIR}/dynamic/person_workAt_organisation${NEO4J_CSV_POSTFIX}" \
  --delimiter '|'
